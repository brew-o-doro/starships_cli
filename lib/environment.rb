# frozen_string_literal: true

require_relative "./starships_cli/version"

require "bundler"

Bundler.require

require_relative "./starships_cli/cli"
require_relative "./starships_cli/api"
require_relative "./starships_cli/starships"