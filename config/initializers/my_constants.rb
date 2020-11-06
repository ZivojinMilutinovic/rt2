def create_Hash_Control_Number
    hash={}
    i=10
    [*('A'..'Z')].each do |el|
        hash[el]=i
        i+=1
    end
    hash
end
HASH_CONTROL_NUMBER=create_Hash_Control_Number
CIFRE=[*('0'..'9')]
