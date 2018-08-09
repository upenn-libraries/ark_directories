module Naming
  extend self

  def directorify(ark)
    return ark.to_s.gsub(/[:\/]/, ':' => '+', '/' => '=') unless ark.nil?
  end

end