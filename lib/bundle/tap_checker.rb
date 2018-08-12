# frozen_string_literal: true

module Bundle
  module Checker
    class TapChecker < Bundle::Checker::Base
      PACKAGE_TYPE = :tap
      PACKAGE_TYPE_NAME = "Tap"

      def select_checkable(entries)
        super(entries).map(&:name)
      end

      def find_actionable(entries)
        requested_taps = select_checkable(entries)
        return NO_ACTION if requested_taps.empty?

        current_taps = Bundle::TapDumper.tap_names
        (requested_taps - current_taps).map { |entry| "Tap #{entry} needs to be tapped." }
      end
    end
  end
end
