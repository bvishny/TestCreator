class HerpetologyController < ApplicationController
  before_filter :init_main, :except => [:index]
  after_filter :update_herps, :except => [:index]
  layout 'blank'
  def quiz
    @taxa = Dir.entries("/vservers/interech/woofic/herps/").delete_if {|x| x == ".." or x == "." }
  end
  def set_taxa
    session[:taxa] = params[:taxa]
    redirect_to_url "/herpetology/random_quiz"
  end
  def random_quiz
    @taxa2 = Dir.entries("/vservers/interech/woofic/herps/").delete_if {|x| x == ".." or x == "." }
    @taxa = session[:taxa]
    #@taxa.sort_by {rand }
    #@order = @taxa[rand(@taxa.size) - 1]
    @order = @taxa
    begin
      @families = Dir.entries("/vservers/interech/woofic/herps/#{@order}").delete_if {|x| x == ".." or x == "." }
    rescue
      # Problem
    else
        number = rand(@families.size) - 1
        @families.sort_by {rand }
        @family = @families[number].gsub(" copy1", "").gsub(" copy2", "").gsub(" copy3", "")
        @genera = Dir.entries("/vservers/interech/woofic/herps/#{@order}/#{@family}").delete_if {|x| x == ".." or x == "." or x == "not_accountable.yml" }
        @genera.sort_by {rand }

        number = rand(@genera.size) - 1
        @genus = @genera[number]
        session[:filename] = "#{@order}/#{@family}/#{@genus}"
        session[:family] = @family
    end
    begin
      unless FileTest.exists? "/vservers/interech/woofic/herps/#{@order}/#{@family}/not_accountable.yml"
        session[:genus] = @genus.split("_")[0]
      end
    rescue
      redirect_to_url("/herpetology/error")
    ensure
      session[:genus_not_accountable] = FileTest.exists? "/vservers/interech/woofic/herps/#{@order}/#{@family}/not_accountable.yml"
    end
  end
  def error
    render :text => "<h1 style='font-family:helvetica;font-size:14px;'>The resource you requested was not found.</h1><form action='/herpetology/quiz'><button type='submit'>Back</button></form>"
  end
  def proxy_image
    begin
      @file_name = "/vservers/interech/woofic/herps/" + session[:filename]
    rescue
      render :text => "An error occurred."
    else
      send_file @file_name, :type => 'image/jpeg', :disposition => 'inline', :filename => "MYSTERY"
    end
  end
  def check_answers
    family = params[:family]
    genus = params[:genus]
    output = "<script type='text/javascript'>"
    if family.downcase == session[:family].downcase
      output += "$('family').update('<strong>Family (Correct):</strong>');"
    else
      output += "$('family').update('<strong>Family (Incorrect) - Correct Answer: #{session[:family]}:</strong>');"
    end
    if session[:genus_not_accountable]
      output += "$('genus').update('<strong>Genus (Not Accountable):</strong>');"
    else
      if genus.downcase == session[:genus].downcase
        output += "$('genus').update('<strong>Genus (Correct):</strong>');"
      else
        output += "$('genus').update('<strong>Genus (Incorrect) - Correct Answer: #{session[:genus].capitalize}:</strong>');"
      end
    end
    render :text => output + "</script>"
  end
  def genus
    begin
    @page_count = 0
    genus = params[:id].downcase
    search_page = open "http://www.tigr.org/reptiles/?taxon=&genus=#{genus}&species=&subspecies=&author=&year=&common_name=&location=&holotype=&reference=&submit=Search"
    @page_count += 1
    page = Hpricot(search_page)
    @species = []
    page.search("//li")  do |row|
      @spec = row.search("//em")
      for s in @spec
        if s.inner_html.include? genus.capitalize + " "
          @species << s.inner_html
        end
      end
    end
    @herp_pics = []
    for s in @species
      herp_page = open "http://www.tigr.org/reptiles/species.php?genus=#{genus}&species=#{s.split(' ')[1]}"
      @page_count += 1
      page = Hpricot(herp_page)
      page.search("//td[@class='i']")  do |r|
        if r.inner_html.include? ","
          @taxa = r.inner_html
        end
      end
      page.search("//img[@width='50']")  do |r|
        unless is_blocked? r.attributes["src"]
          @herp_pics << r.attributes["src"]
        end
      end
    end
    unless @herps.include? ["Order", @taxa.split(",")[1], "Family", @taxa.split(",")[0], "Genus", genus, @species, @herp_pics]
      @herps << ["Order", @taxa.split(",")[1], "Family", @taxa.split(",")[0], "Genus", genus, @species, @herp_pics]
    end
    #render :text => @herps.inspect
  rescue
    render :text => "<h1>Genus #{params[:id]} does not exist! Maybe you specified a family name!</h1>"
  end
  end
  def clear
    unless params[:id] == "no_write"
      write
    else
      render :text => "Session cleared."
    end
    @herps = []
  end
  def write
    pin = session[:pin] ||= rand(1000)
    file = File.open("/vservers/interech/woofic/herps/#{pin}.yml", "w") { |f| f.puts @herps.to_yaml }
    session[:pin] = pin 
    render :text => "Session Pin: #{pin}"
  end
  def retrieve
    pin = params[:id].to_i
    if FileTest.exists? "/vservers/interech/woofic/herps/#{pin}.yml"
      begin
        file = File.new("/vservers/interech/woofic/herps/#{pin}.yml")
      rescue
        render :text => "Invalid Pin"
      else
        @herps = YAML.load(file.read)
        render :text => "Session with PIN #{pin} retrieved."
      ensure
        file.close
      end
    else
      render :text => "Invalid Pin"
    end
  end
  private
  def init_main
    require 'open-uri'
    require 'hpricot'
    require 'mechanize'
    if session[:herps]
      @herps = session[:herps]
    else
      session[:herps] = []
      @herps = []
    end
  end
  def update_herps
    session[:herps] = @herps
  end
  def is_blocked? url
    domains = ["uroplatus.com", "fortunecity.com", "biodec.wustl.edu", "herpetario.tripod.com"]
    for d in domains
      if url.include? d
        error = true
      end
    end
    if error
      true
    else
      false
    end
  end
  def genus_search(genus)
    begin
    @page_count = 0
    search_page = open "http://www.tigr.org/reptiles/?taxon=&genus=#{genus}&species=&subspecies=&author=&year=&common_name=&location=&holotype=&reference=&submit=Search"
    @page_count += 1
    page = Hpricot(search_page)
    @species = []
    page.search("//li")  do |row|
      @spec = row.search("//em")
      for s in @spec
        if s.inner_html.include? genus.capitalize + " "
          @species << s.inner_html
        end
      end
    end
    @herp_pics = []
    for s in @species
      herp_page = open "http://www.tigr.org/reptiles/species.php?genus=#{genus}&species=#{s.split(' ')[1]}"
      @page_count += 1
      page = Hpricot(herp_page)
      page.search("//td[@class='i']")  do |r|
        if r.inner_html.include? ","
          @taxa = r.inner_html
        end
      end
      page.search("//img[@width='50']")  do |r|
        unless is_blocked? r.attributes["src"]
          @herp_pics << r.attributes["src"]
        end
      end
    end
    unless @herps.include? ["Order", @taxa.split(",")[1], "Family", @taxa.split(",")[0], "Genus", genus, @species, @herp_pics]
      @herps << ["Order", @taxa.split(",")[1], "Family", @taxa.split(",")[0], "Genus", genus, @species, @herp_pics]
    end
    #render :text => @herps.inspect
  rescue
    return 400
  end
  end
end

