def reject_hacker
  redirect '/login' unless authenticated?
end

def authenticated?
  !!session[:user_id]
end