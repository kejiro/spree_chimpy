module Spree
  module Chimpy
    module UserDecorator
      def self.prepended(base)
        base.before_create :subscribe
        base.before_destroy :unsubscribe
        base.after_initialize :assign_subscription_default

        base.delegate :subscribe, :resubscribe, :unsubscribe, to: :subscription
      end

      private

      def subscription
        Spree::Chimpy::Subscription.new(self)
      end

      def assign_subscription_default
        self.subscribed ||= Spree::Chimpy::Config.subscribed_by_default if new_record?
      end
    end
  end
end

Spree.user_class.prepend(Spree::Chimpy::UserDecorator) if Spree.user_class
