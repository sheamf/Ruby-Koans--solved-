
assert_equal expected_value, actual_value
assert_equal ___, 1 + 1

assert_equal expected_value, actual_value
assert_equal 2, 1 + 1


    
    
    
	
	assert_equal ___, 123.inspect
	assert_equal ___, "hi".inspect
	
	obj = Object.new
    assert_equal Fixnum, obj.object_id.class
    
   
   

	
	assert_equal "123", 123.inspect
	assert_equal "\"hi\"", "hi".inspect
	
	obj = Object.new
    assert_equal Fixnum, obj.object_id.class 
    
    
    
    

	assert_equal ___, nil.is_a?(Object), 
    assert_equal ___, nil.nil?
    assert_equal ___, nil.to_s
    assert_equal ___, nil.inspect
    
	assert_equal true, nil.is_a?(Object), "Unlike NULL in other languages"
    assert_equal true, nil.nil?
    assert_equal "", nil.to_s
    assert_equal "nil", nil.inspect
    
    
    
    
    
    
	
  def test_small_integers_have_fixed_ids
    assert_equal   1,   0.object_id
    assert_equal   3,   1.object_id
    assert_equal   5,   2.object_id
    assert_equal 201, 100.object_id
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal true, obj           != copy
    assert_equal true, obj.object_id != copy.object_id
  end

    array = [1, 2]
    array << 333
    assert_equal [1, 2, 333], array
  
    array = [:peanut, :butter, :and, :jelly] 
    assert_equal :peanut, array.first
    assert_equal :jelly, array.last
    assert_equal :butter, array[-3]

		
    array = [:peanut, :butter, :and, :jelly]
	
  def test_slicing_arrays 
    assert_equal ___, array[0,1]
    assert_equal ___, array[0,2]
    assert_equal ___, array[2,2]
    assert_equal ___, array[2,20]
    assert_equal ___, array[4,0]
    assert_equal ___, array[4,100]
    assert_equal ___, array[5,0] 
  end
   
	#the first digit is the starting position, and the second is 
	#the LENGTH of what it will return, NOT the ending position!
	
	#ex: list = [:a, :b, :c, :d]
		#list[0, 3]
		#>>[:a, :b, :c]
		#list[2, 3]
		#>>[:c, :d]
		#list[2, 1]
		#>>[:c]
		
    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0]
  
  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1, 2, 3, 4, 5], (1..5).to_a
    assert_equal [1, 2, 3, 4], (1...5).to_a
  end
  
  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut, :butter], array[0...2]
    assert_equal [:and, :jelly], array[2..-1]
  end  
  
  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)
    assert_equal [1, 2, :last], array

    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1, 2], array
  end  
  
  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)
    assert_equal [:first, 1, 2], array

    shifted_value = array.shift
    assert_equal :first, shifted_value
    assert_equal [1, 2], array
  end  
  
  def test_parallel_assignments_with_extra_values
    first_name, last_name = ["John", "Smith", "III"]
    assert_equal "John", first_name
    assert_equal "Smith", last_name
  end
  
  def test_parallel_assignments_with_splat_operator
    first_name, *last_name = ["John", "Smith", "III"]
    assert_equal "John", first_name
    assert_equal ["Smith", "III"], last_name
  end 
  
  def test_parallel_assignments_with_too_few_variables
    first_name, last_name = ["Cher"]
    assert_equal "Cher", first_name
    assert_equal nil, last_name
  end

  def test_parallel_assignments_with_subarrays
    first_name, last_name = [["Willie", "Rae"], "Johnson"]
    assert_equal ["Willie", "Rae"], first_name
    assert_equal "Johnson", last_name
  end  
  
  def test_accessing_hashes_with_fetch
    hash = { :one => "uno", :two => "dos" }
	assert_equal "uno", hash[:one]
	assert_equal nil, hash[:doesnt_exist]
    assert_equal "uno", hash.fetch(:one)
    assert_raise(KeyError) do
	  hash.fetch(:doesnt_exist)
  end 
 # THINK ABOUT IT:
 # Why might you want to use #fetch instead of #[] when accessing hash keys?  
  
  def test_hash_is_unordered
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }
    assert_equal hash2 == hash1, hash1 == hash2
  end

   def test_hash_keys
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.keys.size
    assert_equal true, hash.keys.include?(:one)
    assert_equal true, hash.keys.include?(:two)
    assert_equal Array, hash.keys.class
  end

  def test_hash_values
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.values.size
    assert_equal true, hash.values.include?("uno")
    assert_equal true, hash.values.include?("dos")
    assert_equal Array, hash.values.class
  end 
  
  def test_combining_hashes
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })
	assert_equal true, hash != new_hash

    expected = { "jim" => 54, "amy" => 20, "dan" => 23, "jenny" => 26 }
    assert_equal true, expected == new_hash
  end

  def test_default_value
    hash1 = Hash.new
    hash1[:one] = 1

    assert_equal 1, hash1[:one]
    assert_equal nil, hash1[:two]

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    assert_equal 1, hash2[:one]
    assert_equal "dos", hash2[:two]
  end  
  
  def test_default_value_is_the_same_object
    hash = Hash.new([])

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal ["uno", "dos"], hash[:one]
    assert_equal ["uno", "dos"], hash[:two]
    assert_equal ["uno", "dos"], hash[:three]

    assert_equal true, hash[:one].object_id == hash[:two].object_id
  end 
  
  def test_default_value_with_block
    hash = Hash.new {|hash, key| hash[key] = [] }

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal ["uno"], hash[:one]
    assert_equal ["dos"], hash[:two]
    assert_equal [], hash[:three]
  end  
  
    string = 'Goodbye, World'
    assert_equal true, string.is_a?(String)  
  
    string = 'He said, "Go Away."'
    assert_equal "He said, \"Go Away.\"", string
  
    string = "Don't"
    assert_equal 'Don\'t', string
  
    a = "He said, \"Don't\""
    b = 'He said, "Don\'t"'
    assert_equal true, a == b 
  
  def test_use_flexible_quoting_to_handle_really_hard_cases
    a = %(flexible quotes can handle both ' and " characters)
    b = %!flexible quotes can handle both ' and " characters!
    c = %{flexible quotes can handle both ' and " characters}
    assert_equal true, a == b
    assert_equal true, a == c
  end
  
  def test_flexible_quotes_can_handle_multiple_lines
    long_string = %{
		It was the best of times,
		It was the worst of times.
		}
    assert_equal 54, long_string.length #51 for the words + 3 for the 3 * \n
    assert_equal 3, long_string.lines.count
    assert_equal "\n", long_string[0,1]
  end
  
  def test_here_documents_can_also_handle_multiple_lines
    long_string = <<EOS
		It was the best of times,
		It was the worst of times.
EOS
    assert_equal 53, long_string.length #doesn't start with \n, so only 2
    assert_equal 2, long_string.lines.count #the \n must affect line count?
    assert_equal "I", long_string[0,1]
  end  
  
  def test_plus_concatenation_will_leave_the_original_strings_unmodified
    hi = "Hello, "
    there = "World"
    string = hi + there
    assert_equal "Hello, ", hi
    assert_equal "World", there
  end

  def test_plus_equals_will_concatenate_to_the_end_of_a_string
    hi = "Hello, "
    there = "World"
    hi += there
    assert_equal "Hello, World", hi
  end 
  
  def test_the_shovel_operator_will_also_append_content_to_a_string
    hi = "Hello, "
    there = "World"
    hi << there
    assert_equal "Hello, World", hi
    assert_equal "World", there
  end

  def test_the_shovel_operator_modifies_the_original_string
    original_string = "Hello, "
    hi = original_string
    there = "World"
    hi << there
    assert_equal "Hello, World", original_string

    # THINK ABOUT IT:
    #
    # Ruby programmers tend to favor the shovel operator (<<) over the
    # plus equals operator (+=) when building up strings.  Why?
  end 
  
  #double quotes interpret escape characters, single quotes do not
    string = "\n"
    assert_equal 1, string.size
    string = '\n'
    assert_equal 2, string.size
  #except when they do
    string = '\\\''
    assert_equal 2, string.size
    assert_equal "\\'", string
  
  #single quotes strings do not interpolate
    value = 123
    string = 'The value is #{value}'
    assert_equal "The value is \#{value}", string  
  
  #any_ruby_expression_may_be_interpolated
    string = "The square root of 5 is #{Math.sqrt(5)}"
    assert_equal "The square root of 5 is 2.23606797749979", string
  
    string = "Bacon, lettuce and tomato"
    assert_equal "let", string[7,3]
    assert_equal "let", string[7..9] 
    assert_equal "a", string[1]
  
  in_ruby_version("1.9") do
    def in_ruby_1_9_single_characters_are_represented_by_strings
      assert_equal "a", ?a
      assert_equal false, ?a == 97 #in 1.8, rep by integers
    end
  end 
  
    string = "the:rain:in:spain"
    words = string.split(/:/) #RegEx split
    assert_equal ["the", "rain", "in", "spain"], words
  
    words = ["Now", "is", "the", "time"]
    assert_equal "Now is the time", words.join(" ")
  
    a = "a string"
    b = "a string"
    assert_equal true, a == b
    assert_equal false, a.object_id == b.object_id
  
  def test_identical_symbols_are_a_single_internal_object
    symbol1 = :a_symbol
    symbol2 = :a_symbol

    assert_equal true, symbol1           == symbol2
    assert_equal true, symbol1.object_id == symbol2.object_id
  end 
  
    def test_symbols_can_be_made_from_strings
    string = "catsAndDogs"
    assert_equal :catsAndDogs, string.to_sym
  end

  def test_symbols_with_spaces_can_be_built
    symbol = :"cats and dogs"
    assert_equal "cats and dogs".to_sym, symbol
  end

  def test_symbols_with_interpolation_can_be_built
    value = "and"
    symbol = :"cats #{value} dogs"
    assert_equal "cats and dogs".to_sym, symbol
  end

  def test_to_s_is_called_on_interpolated_symbols
    symbol = :cats
    string = "It is raining #{symbol} and dogs."

    assert_equal "It is raining cats and dogs.", string
  end

  def test_symbols_are_not_strings
    symbol = :ruby
    assert_equal false, symbol.is_a?(String)
    assert_equal false, symbol.eql?("ruby")
  end
  
  def test_symbols_can_be_dynamically_created
    assert_equal :catsdogs, ("cats" + "dogs").to_sym
  end

  # THINK ABOUT IT:
  # Why is it not a good idea to dynamically create a lot of symbols? 
  
  def test_a_pattern_is_a_regular_expression
    assert_equal Regexp, /pattern/.class
  end

  def test_a_regexp_can_search_a_string_for_matching_content
    assert_equal "match", "some matching content"[/match/]
  end

  def test_a_failed_match_returns_nil
    assert_equal nil, "some matching content"[/missing/]
  end
  
    def test_question_mark_means_optional
    assert_equal "ab", "abbcccddddeeeee"[/ab?/]
    assert_equal "a", "abbcccddddeeeee"[/az?/]
  end

  def test_plus_means_one_or_more
    assert_equal "bccc", "abbcccddddeeeee"[/bc+/]
  end

  def test_asterisk_means_zero_or_more
    assert_equal "abb", "abbcccddddeeeee"[/ab*/]
    assert_equal "a", "abbcccddddeeeee"[/az*/]
    assert_equal "", "abbcccddddeeeee"[/z*/]
  end
  
  def test_the_left_most_match_wins
    assert_equal "a", "abbccc az"[/az*/]
  end
  
  def test_character_classes_give_options_for_a_character
    animals = ["cat", "bat", "rat", "zat"]
    assert_equal ["cat", "bat", "rat"], animals.select { |a| a[/[cbr]at/] }
  end

  def test_slash_d_is_a_shortcut_for_a_digit_character_class
    assert_equal "42", "the number is 42"[/[0123456789]+/]
    assert_equal "42", "the number is 42"[/\d+/]
  end

  def test_character_classes_can_include_ranges
    assert_equal "42", "the number is 42"[/[0-9]+/]
  end

  def test_slash_s_is_a_shortcut_for_a_whitespace_character_class
    assert_equal " \t\n", "space: \t\n"[/\s+/]
  end

  def test_slash_w_is_a_shortcut_for_a_word_character_class
    # NOTE:  This is more like how a programmer might define a word.
    assert_equal "variable_1", "variable_1 = 42"[/[a-zA-Z0-9_]+/]
    assert_equal "variable_1", "variable_1 = 42"[/\w+/]
  end

  def test_period_is_a_shortcut_for_any_non_newline_character
    assert_equal "abc", "abc\n123"[/a.+/]
  end

  def test_a_character_class_can_be_negated
    assert_equal "the number is ", "the number is 42"[/[^0-9]+/]
  end

  def test_shortcut_character_classes_are_negated_with_capitals
    assert_equal "the number is ", "the number is 42"[/\D+/] #matches no d
    assert_equal "space:", "space: \t\n"[/\S+/] #matches no whitespace char
    # ... a programmer would most likely do
    assert_equal " = ", "variable_1 = 42"[/[^a-zA-Z0-9_]+/]
    assert_equal " = ", "variable_1 = 42"[/\W+/] #don't get this...
  end


  def test_slash_a_anchors_to_the_start_of_the_string
    assert_equal "start", "start end"[/\Astart/]
    assert_equal nil, "start end"[/\Aend/]
  end

  def test_slash_z_anchors_to_the_end_of_the_string
	  assert_equal "end", "start end"[/end\z/]
    assert_equal nil, "start end"[/start\z/]
  end

  def test_caret_anchors_to_the_start_of_lines
    assert_equal "2", "num 42\n2 lines"[/^\d+/]
  end

  def test_dollar_sign_anchors_to_the_end_of_lines
    assert_equal "42", "2 lines\nnum 42"[/\d+$/]
  end

  def test_slash_b_anchors_to_a_word_boundary
    assert_equal "vines", "bovine vines"[/\bvine./]
  end


  def test_parentheses_group_contents
    assert_equal "hahaha", "ahahaha"[/(ha)+/]
  end


  def test_parentheses_also_capture_matched_content_by_number
    assert_equal "Gray", "Gray, James"[/(\w+), (\w+)/, 1]
    assert_equal "James", "Gray, James"[/(\w+), (\w+)/, 2]
  end

  def test_variables_can_also_be_used_to_access_captures
    assert_equal "Gray, James", "Name:  Gray, James"[/(\w+), (\w+)/]
    assert_equal "Gray", $1 #how does it know to assign this to $1 vs $0?
    assert_equal "James", $2
  end

  def test_a_vertical_pipe_means_or
    grays = /(James|Dana|Summer) Gray/
    assert_equal "James Gray", "James Gray"[grays]
    assert_equal "Summer", "Summer Gray"[grays, 1] #the 1 designates first name
    assert_equal nil, "Jim Gray"[grays, 1]
  end

  # THINK ABOUT IT:
  # Explain the difference between a character class ([...]) and alternation (|).


  def test_scan_is_like_find_all
    assert_equal ["one", "two", "three"], "one two-three".scan(/\w+/)
  end

  def test_sub_is_like_find_and_replace
    assert_equal "one t-three", "one two-three".sub(/(t\w*)/) { $1[0, 1] }
  end

  def test_gsub_is_like_find_and_replace_all
    assert_equal "one t-t", "one two-three".gsub(/(t\w*)/) { $1[0, 1] }
    # to test/understand, run these:
    # "one two-three".gsub(/(t\w*)/) { $1[0, 2] }
    # "one two-three".gsub(/(o\w*)/) { $1[0, 1] }
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
