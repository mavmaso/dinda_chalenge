class RankWriter
  require "csv"

  def initialize(rank:)
    @rank = rank
  end

  def write_rank_to_file(file_path:, file_name:)
    CSV.open("#{file_path}/#{file_name}", "wb") do |csv|
      @rank.each do |position|
        csv << (position[:commiter].values << position[:score])
      end
    end
  end
end
