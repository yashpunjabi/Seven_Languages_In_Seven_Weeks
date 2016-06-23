# Modify the CSV application (acts_as_csv_class.rb) to support an each method to
# return a CsvRow object. Use method_missing on that CsvRow to return the value
# for the column for a given heading.

class ActsAsCsv
  def read
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(', ')

    file.each do |row|
      @result << row.chomp.split(', ')
    end
  end

  def headers
    @headers
  end

  def csv_contents
    @result
  end

  def initialize
    @result = []
    read
  end

  def each(&block)
      @result.each do |row|
          csv_row = CSVRow.new(@headers, row)
          block.call(csv_row)
      end
  end

end

class CSVRow

    attr_accessor :row, :headers

    def initialize(headers, row)
        @headers = headers
        @row = row
    end


    def method_missing(name, *args)
      index = @headers.index(name.to_s)
      return @row[index]
    end

    def to_s
        return @row.to_s
    end

end

class RubyCsv < ActsAsCsv
end

m = RubyCsv.new

m.each do |row|
    puts row.one + " and " + row.two
end
