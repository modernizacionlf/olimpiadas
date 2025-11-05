class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotUnique, with: :render_conflict
  rescue_from ActiveRecord::StatementInvalid, with: :render_bad_request
  rescue_from ActionController::ParameterMissing, with: :render_bad_request
  rescue_from Pundit::NotAuthorizedError, with: :render_forbidden if defined?(Pundit)
  rescue_from CanCan::AccessDenied, with: :render_forbidden if defined?(CanCan)

  private

  # ⚠️ 404 - No encontrado
  def render_not_found(exception = nil)
    logger.warn("⚠️ Record not found: #{exception.message}") if exception
    render file: Rails.root.join('public', '404.html'),
           status: :not_found,
           layout: false
  end

  # ⚠️ 400 - Petición inválida
  def render_bad_request(exception = nil)
    logger.warn("⚠️ Bad request: #{exception.message}") if exception
    render plain: "Parámetros inválidos o consulta errónea", status: :bad_request
  end

  # ⚠️ 403 - Prohibido / Sin permisos
  def render_forbidden(exception = nil)
    logger.warn("🚫 Forbidden: #{exception.message}") if exception
    render plain: "No tienes permiso para realizar esta acción", status: :forbidden
  end

  # ⚠️ 409 - Conflicto (por ejemplo, registro duplicado)
  def render_conflict(exception = nil)
    logger.warn("⚠️ Conflict: #{exception.message}") if exception
    render plain: "El registro ya existe o hay un conflicto de datos", status: :conflict
  end

  # ⚠️ 422 - Entidad no procesable (validaciones fallidas)
  def render_unprocessable_entity(exception = nil)
    logger.warn("⚠️ Unprocessable entity: #{exception.message}") if exception
    render plain: "Datos inválidos o no se pudo guardar el registro", status: :unprocessable_entity
  end
end
