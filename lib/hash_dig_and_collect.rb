module HashDigAndCollect
  def self.call(hash, next_key, *keys)
    return [] unless hash.has_key? next_key

    next_val = hash[next_key]
    return [next_val] if keys.empty?

    case next_val
    when Hash
      HashDigAndCollect.call(next_val, *keys)
    when Array
      next_val.flat_map { |v| HashDigAndCollect.call(v, *keys) }
    else
      []
    end
  end

  def dig_and_collect(next_key, *keys)
    HashDigAndCollect.call(self, next_key, *keys)
  end
end
