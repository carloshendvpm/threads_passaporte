require 'json'
require 'csv'
require 'benchmark'
require_relative 'algorithms'

def load_samples
  JSON.parse(File.read('samples.txt'))
end

def run_sorting_algorithms(samples)
  results = []

  samples.each do |size, array|
    puts "\nExecutando algoritmos de ordenação para o array de tamanho #{size}...\n"
    threads = []
    algorithms = {
      'BubbleSort' => method(:bubble_sort),
      'QuickSort' => method(:quick_sort),
      'MergeSort' => method(:merge_sort)
    }

    algorithms.each do |name, algorithm|
      threads << Thread.new do
        puts "Iniciando #{name} - tamanho #{size}..."
        time = Benchmark.realtime { algorithm.call(array.dup) }
        puts "#{name} para tamanho #{size} concluído em #{time.round(2)} segundos."
        results << { algorithm: name, size: size, time: time }
      end
    end

    threads.each(&:join)
  end

  save_results(results)
end

def save_results(results)
  CSV.open("results.csv", "wb") do |csv|
    csv << ["Algorithm", "Size", "Time"]
    results.each { |result| csv << [result[:algorithm], result[:size], result[:time]] }
  end
  puts "\nResultados salvos em 'results.csv'."
end

samples = load_samples
run_sorting_algorithms(samples)
