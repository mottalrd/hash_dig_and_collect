module HashDigAndCollect
  def dig_and_collect *keys
    keys = keys.dup

    next_key = keys.shift
    return [] unless self.has_key? next_key

    next_val = self[next_key]
    return [next_val] if keys.empty?

    return next_val.dig_and_collect(*keys) if next_val.is_a? Hash

    return [] unless next_val.is_a? Array
    next_val.each_with_object([]) do |v, result|
      inner = v.dig_and_collect(*keys)
      result.concat inner
    end
  end
end

class Hash
  include HashDigAndCollect
end
