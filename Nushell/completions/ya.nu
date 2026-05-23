module completions {

  # Yazi command-line interface
  export extern ya [
    --version(-V)             # Print version
    --help(-h)                # Print help
  ]

  # Emit an action to be executed by the current instance
  export extern "ya emit" [
    --help(-h)                # Print help
    name: string              # Name of the action
    ...args: string           # Arguments of the action
  ]

  # Emit an action to be executed by the specified instance
  export extern "ya emit-to" [
    --help(-h)                # Print help
    receiver: string          # Receiver ID
    name: string              # Name of the action
    ...args: string           # Arguments of the action
  ]

  # Execute an action on the current instance and print its result
  export extern "ya exec" [
    --help(-h)                # Print help
    name: string              # Name of the action
    ...args: string           # Arguments of the action
  ]

  # Manage packages
  export extern "ya pkg" [
    --help(-h)                # Print help
  ]

  # Add packages
  export extern "ya pkg add" [
    --help(-h)                # Print help
    ...ids: string            # Packages to add
  ]

  # Delete packages
  export extern "ya pkg delete" [
    --discard                 # Discard local changes made to packages while deleting
    --help(-h)                # Print help
    ...ids: string            # Packages to delete
  ]

  # Install all packages
  export extern "ya pkg install" [
    --discard                 # Discard local changes made to packages while installing
    --help(-h)                # Print help
  ]

  # List all packages
  export extern "ya pkg list" [
    --help(-h)                # Print help
  ]

  # Upgrade all packages
  export extern "ya pkg upgrade" [
    --discard                 # Discard local changes made to packages while upgrading
    --help(-h)                # Print help
    ...ids: string            # Packages to upgrade, upgrade all if unspecified
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "ya pkg help" [
  ]

  # Add packages
  export extern "ya pkg help add" [
  ]

  # Delete packages
  export extern "ya pkg help delete" [
  ]

  # Install all packages
  export extern "ya pkg help install" [
  ]

  # List all packages
  export extern "ya pkg help list" [
  ]

  # Upgrade all packages
  export extern "ya pkg help upgrade" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "ya pkg help help" [
  ]

  # Publish a message to the current instance
  export extern "ya pub" [
    --str: string             # Send the message with a string body
    --json: string            # Send the message with a JSON body
    --list: string            # Send the message as a list of strings
    --help(-h)                # Print help
    kind: string              # Kind of message
  ]

  # Publish a message to the specified instance
  export extern "ya pub-to" [
    --str: string             # Send the message with a string body
    --json: string            # Send the message with a JSON body
    --list: string            # Send the message as a list of strings
    --help(-h)                # Print help
    receiver: string          # Receiver ID
    kind: string              # Kind of message
  ]

  # Subscribe to messages from all remote instances
  export extern "ya sub" [
    --help(-h)                # Print help
    kinds: string             # Kind of messages to subscribe to, separated by commas if multiple
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "ya help" [
  ]

  # Emit an action to be executed by the current instance
  export extern "ya help emit" [
  ]

  # Emit an action to be executed by the specified instance
  export extern "ya help emit-to" [
  ]

  # Execute an action on the current instance and print its result
  export extern "ya help exec" [
  ]

  # Manage packages
  export extern "ya help pkg" [
  ]

  # Add packages
  export extern "ya help pkg add" [
  ]

  # Delete packages
  export extern "ya help pkg delete" [
  ]

  # Install all packages
  export extern "ya help pkg install" [
  ]

  # List all packages
  export extern "ya help pkg list" [
  ]

  # Upgrade all packages
  export extern "ya help pkg upgrade" [
  ]

  # Publish a message to the current instance
  export extern "ya help pub" [
  ]

  # Publish a message to the specified instance
  export extern "ya help pub-to" [
  ]

  # Subscribe to messages from all remote instances
  export extern "ya help sub" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "ya help help" [
  ]

}

export use completions *
