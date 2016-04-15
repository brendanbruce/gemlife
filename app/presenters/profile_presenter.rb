class ProfilePresenter < SimpleDelegator

  def initialize(profile)
    super(profile)
    @profile = profile
  end

  def social_array
    Array([[@profile.website, "globe"],
           [@profile.twitter, "twitter"],
           [@profile.facebook, "facebook"],
           [@profile.soundcloud, "soundcloud"],
           [@profile.mixcloud, "mixcloud"]])
  end

end
