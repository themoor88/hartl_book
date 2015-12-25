module UsersHelper
  # Returns an image tag for the user.
  # Gravatar uses an MD5 hashing algorithm for its emails, which ruby uses with hexdigest.
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = 'https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}'
    image_tag(gravatar_url, alt: user.name, class: 'gravtar')
  end
end
