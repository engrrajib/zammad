class Sequencer
  class Unit
    module Import
      module Common
        module Model
          module Attributes
            class CheckMandatory < Sequencer::Unit::Base
              prepend ::Sequencer::Unit::Import::Common::Model::Mixin::SkipOnProvidedInstanceAction

              uses :mapped
              provides :instance_action

              def process
                mandatory.each do |mapped_attribute|
                  next if mapped[mapped_attribute].present?
                  state.provide(:instance_action, :skipped)
                  break
                end
              end

              private

              def mandatory
                raise "Missing implementation of '#{__method__}' method for '#{self.class.name}'"
              end
            end
          end
        end
      end
    end
  end
end
