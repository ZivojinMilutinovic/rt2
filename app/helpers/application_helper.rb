module ApplicationHelper
    def valid_control_number(number)
        number.each_char do |ch|
            return false if ![*('A'..'Z'),*('0'..'9')].include?(ch)
        end
        true
    end
    def izracunaj_sumu(number)
        suma=""
        number.each_char do |ch|
            if CIFRE.include?(ch)
                suma+=ch
            else
                suma+=HASH_CONTROL_NUMBER[ch].to_s
            end
        end
        98-(suma.to_i*100)%97
    end
end
