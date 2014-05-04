module ApplicationHelper

end

def cap_each_word(word)
  word.split.map(&:capitalize).join(' ')
end