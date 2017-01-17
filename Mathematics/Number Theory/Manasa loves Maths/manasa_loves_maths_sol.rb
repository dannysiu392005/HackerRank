# Enter your code here. Read input from STDIN. Print output to STDOUT
# The strategy is to understand 8 divides a number if and only if 8 divides the last three digits of the number
# Also, the units digit must be divisible by 2, i.e. it must be either 0, 2, 4, 6, or 8

T = gets.to_i
i = 1
while i<=T do
    numberString = gets.strip
    numbers = numberString.split('').map(&:to_i)
    digits = Array.new(10, 0)
    numbers.each { |d| digits[d]+=1 }
    printed = false
    
    if digits[0]+digits[2]+digits[4]+digits[6]+digits[8] == 0
        puts "NO"
    elsif numberString.length == 1 # The number has only one digit
        if numberString.to_i % 8 == 0
            puts "YES"
        else
            puts "NO"
        end
    elsif numberString.length == 2 # The number has only two digits
        if numberString.to_i % 8 == 0 || numberString.reverse.to_i % 8 == 0
            puts "YES"
        else
            puts "NO"
        end
    else
        units = 0
        while units <= 8 do
            break if printed
            if digits[units] != 0
                digits[units]-=1 # Need to minus 1 when taking a digit to use
                units_digit = units
                tens = 0
                while tens <= 9 do
                    break if printed
                    if digits[tens] != 0
                        digits[tens]-=1 # Need to minus 1 when taking a digit to use
                        tens_digit = tens
                        hundreds = 0
                        while hundreds <= 9 do
                            if digits[hundreds] != 0
                                digits[hundreds]-=1 # Need to minus 1 when taking a digit to use
                                hundreds_digit = hundreds
                                # Form the number
                                testNum = 100 * hundreds_digit + 10 * tens_digit + units_digit
                                if testNum % 8 == 0
                                    puts "YES"
                                    printed = true
                                    break
                                end
                                digits[hundreds]+=1 # Put back the digit after use
                            end
                            hundreds+=1
                        end
                        digits[tens]+=1 # Put back the digit after use
                    end
                    tens+=1
                end
                digits[units]+=1 # Put back the digit after use
            end
            units+=2
        end
        puts "NO" if !printed
    end
    i+=1
end