defmodule Day01Part2 do
  def start do
    input_list = get_list()
    output_list = []
    start_index = 0
    step = div(length(input_list), 2)

    process(input_list, output_list, start_index, step)
  end

  defp process(input_list, output_list, start_index, _) when start_index > length(input_list) do
    Enum.reduce(output_list, fn(elem, acc) -> elem + acc end)
  end

  defp process(input_list, output_list, start_index, step) do
    next_index = 
      case step == length(input_list) do
        true -> 0
        false -> step
      end

    first = Enum.at(input_list, start_index)               
    next = Enum.at(input_list, next_index)

    new_output_list = 
      case first == next do
        true -> [ first | output_list ]
        false -> output_list
      end

    process(input_list, new_output_list, start_index + 1, next_index + 1)
  end

  defp get_input do
    "../assets/input.txt"
    |> Path.expand(__DIR__)
    |> File.read!    
  end

  defp get_list do
    get_input()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)    
  end  
end
