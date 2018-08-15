require './src/errors/invalid_response_error'
require './src/errors/invalid_url_format_error'
require './src/net_http_client'
require './src/github_commits_mapper'
require './src/github_crawler'
require './src/rank'
require './src/rank_writer'

commits = GithubCrawler.new.craw_commits
commiters = GithubCommitsMapper.new(commits: commits).map_commit_to_commiter
rank = Rank.new(commiters: commiters).rank_by_name

RankWriter.new(rank: rank).write_rank_to_file(file_path: '/tmp', file_name: 'result.csv')