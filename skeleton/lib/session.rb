require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies["_rails_lite_app"]
    if cookie
      @obj_cookie = JSON.parse(cookie)
    else
      @obj_cookie = {}
    end
  end

  def [](key)
    @obj_cookie[key]
  end

  def []=(key, val)
    @obj_cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie = { path: "/", value: @obj_cookie.to_json}
    res.set_cookie("_rails_lite_app", cookie)
  end
end
