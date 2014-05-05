module ApplicationHelper

end

def cap_each_word(word)
  word.split.map(&:capitalize).join(' ')
end

def insuff_permissions
  flash[:error] = 'Unauthorized Access Request'
  redirect_to root_path
end