class Rank
  def initialize(commiters:)
    @commiters = commiters
  end

  def rank_by_name
    sorted_rank = sort(rank)
    sorted_rank.map do |commiter_name, commiter_score|
      {
        commiter: find_commiter_info_by_name(commiter_name),
        score: commiter_score
      }
    end
  end

  private

  def rank
    @commiters.each_with_object(Hash.new(0)) do |commiter, counter|
      counter[commiter[:name]] += 1
    end
  end

  def sort(rank)
    rank.sort_by do |_,quantity|
      quantity
    end.reverse
  end

  def find_commiter_info_by_name(commiter_name)
    result = @commiters.find {|commiter| commiter[:name] = commiter_name}
    result.dup
  end
end
