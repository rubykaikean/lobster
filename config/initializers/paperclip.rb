RACKSPACE_CONFIG = {
  'production' => {
    path: '',
    storage: :fog,
    fog_credentials: {
      provider: 'Rackspace',
      rackspace_username: 'estatekitkat',
      rackspace_api_key: '52cf536d0d1b1777371857d419659b73',
      rackspace_region: :hkg,
      persistent: false
    },
    fog_directory: 'ekDeveloper',
    fog_public: true,
    fog_host: 'http://3ac5fb912e25d800250b-bf0e185df54829b58e2f0f5e2f9a8b15.r25.cf6.rackcdn.com'
  },
  'staging' => {
    path: '',
    storage: :fog,
    fog_credentials: {
      provider: 'Rackspace',
      rackspace_username: 'estatekitkat',
      rackspace_api_key: '52cf536d0d1b1777371857d419659b73',
      rackspace_region: :hkg,
      persistent: false
    },
    fog_directory: 'ekDeveloper_staging',
    fog_public: true,
    fog_host: 'http://373883e50aa963d36a5e-ee9b21b2be3be2fb1eb466326037d8f1.r5.cf6.rackcdn.com'
  },
  'development' => {
    # path: '',
    # storage: :fog,
    # fog_credentials: {
    #   provider: 'Rackspace',
    #   rackspace_username: 'estatekitkat',
    #   rackspace_api_key: '52cf536d0d1b1777371857d419659b73',
    #   rackspace_region: :hkg,
    #   persistent: false
    # },
    # fog_directory: 'development',
    # fog_public: true,
    # fog_host: 'http://aad3c01d04d896c3c073-33259659036bd2cd15d862c52ee3d11b.r23.cf6.rackcdn.com'
    path: '',
    storage: :fog,
    fog_credentials: {
      provider: 'Local',
      local_root: "#{Rails.root}/public"
    },
    fog_directory: '',
    fog_host: 'http://localhost:3000'
  },
  'test' => {
    path: '',
    storage: :fog,
    fog_credentials: {
      provider: 'Local',
      local_root: "#{Rails.root}/public"
    },
    fog_directory: '',
    fog_host: 'http://localhost:3000'
  }
}

Paperclip::Attachment.default_options.update(RACKSPACE_CONFIG[Rails.env])