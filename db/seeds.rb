system_dnd = System.create name: 'Dungeons & Dragons'
system_exalted = System.create name: 'Exalted'

user = User.create nickname: 'CountZero', email: 'rjordan@pobox.com', password: 'password1'

Campaign.create name: 'A public D&D campaign', user: user, system: system_dnd,
                public: true, max_players: 6, description: 'A sample public campaign.'

Campaign.create name: 'A private Exalted campaign', user: user, system: system_exalted,
                public: false, max_players: 6, description: 'A sample private campaign.'
