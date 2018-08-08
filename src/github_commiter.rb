class Commit
  def initialize(*args)
    @author = args['commit']['author']
    @message = args['message']
  end
 end
 
 array = []
 GithubCrawler.new.craw_commits.each do |banana|
  array << Commit.new(banana)
 end
 