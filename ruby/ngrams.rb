#!/usr/bin/ruby1.9.1
#my optimized ngrams
FILENAME = 'sample.txt' #around 6000 words
def ngrams(n)
    str = File.read(FILENAME).scan(/\S+/)
    grams = []
    2.upto(n) {|i| grams[i] = Hash.new(0)}
    (str.length-n).times do |i|
        grams[2][gi = str[i]+' '+str[i+1]] += 1
        3.upto(n) { |j|
                grams[j][gi = gi+' '+str[i+j-1]] += 1
        } 
    end
    return grams
end
def ngram(n)
    str = File.read(FILENAME).scan(/\S+/)
    gram = Hash.new(0)
    
end
grams = ngrams(6) #returns an array of <=hexgrams in 1.83 seconds on my machine :)
#usage:
#get all the bi grams
#grams[2].each {|k,v| p k p v}
#get all the tri grams
#grams[3].each {|k,v| p k p v}
# etc etc etc....
#if you want a way to get just a specifir gram and not all the ones before it, contact me ill send it...
