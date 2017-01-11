# Enter your code here. Read input from STDIN. Print output to STDOUT

$number_of_5_hash = {}
$number_of_zeros_to_ans = {}

def numberOf5(n)
  return $number_of_5_hash[n] if $number_of_5_hash[n]
  
  sum = 0
  product = 1
  
  while product <= n do
    product *= 5
    sum += n/product
  end
  
  $number_of_5_hash[n] = sum
  sum
end

N = gets.to_i
i = 1
while i <= N do
  numberOfZeros = gets.to_i
  
  if $number_of_zeros_to_ans[numberOfZeros]
    puts $number_of_zeros_to_ans[numberOfZeros]
    i+=1
    next
  end
  
  j = 4*numberOfZeros + 1
  (j+=1 while j%5!=0) if numberOf5(j) < numberOfZeros # Make sure 5 divides j
  j+=5 while numberOf5(j) < numberOfZeros
  
  puts j
  $number_of_zeros_to_ans[numberOfZeros] = j
  
  i+=1
end