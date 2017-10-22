module HashDigAndCollect
  def dig_and_collect(next_key, *keys)
    return [] unless self.has_key? next_key

    next_val = self[next_key]
    return [next_val] if keys.empty?

    case next_val
    when Hash
      next_val.dig_and_collect(*keys)
    when Array
      next_val.flat_map { |v| v.dig_and_collect(*keys) }
    else
      []
    end
  end
end

class Hash
  include HashDigAndCollect
end
