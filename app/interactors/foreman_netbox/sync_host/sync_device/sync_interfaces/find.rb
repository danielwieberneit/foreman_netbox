# frozen_string_literal: true

module ForemanNetbox
  module SyncHost
    module SyncDevice
      module SyncInterfaces
        class Find
          include ::Interactor

          def call
            context.interfaces = ForemanNetbox::API.client.dcim.interfaces.filter(params)
          rescue NetboxClientRuby::LocalError, NetboxClientRuby::ClientError, NetboxClientRuby::RemoteError => e
            Foreman::Logging.exception("#{self.class} error:", e)
            context.fail!(error: "#{self.class}: #{e}")
          end

          def params
            {
              device_id: context.device.id
            }
          end
        end
      end
    end
  end
end
