module Spree
  module Chimpy
    module OrderDecorator
      def self.prepended(base)
        base.has_one :source, class_name: 'Spree::Chimpy::OrderSource'
        base.state_machine do
          after_transition :to => :complete, :do => :notify_mail_chimp
        end

        base.around_save :handle_cancellation

        def notify_mail_chimp
          Spree::Chimpy.enqueue(:order, self) if completed? && Spree::Chimpy.configured?
        end

        private

        def handle_cancellation
          canceled = state_changed? && canceled?
          yield
          notify_mail_chimp if canceled
        end

      end
    end
  end
end

Spree::Order.prepend(Spree::Chimpy::OrderDecorator)