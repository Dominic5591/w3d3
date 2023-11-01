def range(start, end_point)
  return [] if end_point <= start

  [start] + range(start + 1, end_point)
end

def iter_range(start, end_point)
  num = start
  result = []
  while num < end_point
    result << num
    num += 1
  end
  result
end

def exponent_1(base, power)
  return 1 if power == 0

  base * exponent_1(base, power - 1)
end

def exponent_2(base, power)
  return 1 if power == 0
  return base if power == 1
  if power.even?
    exponent_2(base, (power / 2)) ** 2
  else
    base * (exponent_2(base, (power - 1) / 2) ** 2)
  end
end


class Array
  def deep_dup
    return [*self] if self.none? { |ele| ele.is_a? Array }

    self.map.with_index do |ele, i|
      if ele.is_a? Array
        ele.deep_dup
      else
        ele
      end
    end
  end
end

# 0 1 1 2 3 5

def rec_fib(n)
  return [0,1].take(n) if n <= 2
  previous = rec_fib(n - 1)
  previous << previous[-1] + previous[-2]
end

def iter_fib(n)
  starter = [0, 1]
  return starter.take(n) if n <= 2
  while starter.length < n
    starter << starter[-2] + starter[-1]
  end

  starter
end


def subsets(arr)
  return [[]] if arr.empty?
  return [[], [*arr]] if arr.one?
  previous = subsets(arr[0...-1])
  previous + previous.map { |subarr| subarr + [arr.last] }
end

def bsearch(arr, target)
  return nil if arr.empty?
  middle = arr.length / 2
  compare_info = arr[middle] <=> target

  if compare_info == -1
    latter = bsearch(arr[middle..-1], target)
    if !!latter
      middle + latter
    else
      return nil
    end
  elsif compare_info == 1
    before = bsearch(arr[0...middle], target)
    if !!before
      middle + before
    else
      return nil
    end
  else
    return middle
  end
end


