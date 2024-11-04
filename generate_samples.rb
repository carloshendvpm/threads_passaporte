require 'json'

def generate_samples
  samples = {}
  (1..10).each do |i|
    size = i * 10_000
    samples[size] = Array.new(size) { rand(1..100_000) }
  end
  File.write('samples.txt', JSON.dump(samples))
end

generate_samples