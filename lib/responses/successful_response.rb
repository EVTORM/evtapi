class SuccessfulResponse
  def initialize(data, message = nil)
    @data = data
    @message = message || "La requête a été effectuée avec succès"
  end

  def content
    JSON.generate(
      {
        status: 200,
        message: @message,
        data: @data
      }
    )
  end

  def status_code
    :ok
  end
end
