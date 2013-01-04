#!/usr/bin/env ruby
 
def roman2arabigue(number)
  eqv = { i: [1, false], v: [5, false], x: [10, false], l: [50, false], c: [100, false], d: [500, false], m: [1000, false], }
 
  prs = pre = nil
  sum = aux = cnt = 0
  ref = false
  number.downcase.split("").each do |n|
    val = eqv[n.to_sym][0]
    prs = n.to_sym if prs.nil?
    pre = val if pre.nil?
   
    ref = true if eqv[n.to_sym][1] == true
    if pre == val
      aux += val
      cnt += 1
      ref = true if cnt > 3
    elsif pre > val
      sum += aux
      aux = val
      cnt = 1
    else
      ref true if eqv[prs][1] == true or cnt > 1
      aux = val - aux
      cnt = 0
      eqv.each do |k, v|
        v[1] = true if v[0] >= pre
      end
    end
    prs = n.to_sym
    pre = val
    throw "Invalid number" if ref == true
  end
  sum += aux
end
