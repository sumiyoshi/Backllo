defmodule Backllo.V2.BcklogApiView do
  use Backllo.Web, :view

  def render("statuses.json", %{data: data}) do
    data
  end

  def render("issues.json", %{data: data}) do
    data
  end

  def render("error.json", %{errors: errors}) do
    errors
  end

end
