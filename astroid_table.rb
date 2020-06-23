class AstroidTable
  attr_reader :astroids_data
  def initialize(astroids_data)
    @astroids_data = astroids_data
    @labels = { 
              name: "Name",
              diameter: "Diameter",
              miss_distance: "Missed The Earth By:"
              }
  end

  def column_data
    @labels.each_with_object({}) do |(col, label), hash|
      hash[col] = {
      label: label,
      width: [astroids_data.map { |astroid| astroid[col].size }.max, label.size].max}
    end
  end

  def header
    "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
  end

  def divider
    "+-#{column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"
  end

end