defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

defmodule Main do
  def exec do
    report = %BugReport{ owner: %Customer{name: "Dave Miller", company: "Vacuum Cleaner Company"}, details: "broken"}
    IO.inspect(report)
    report2 = put_in(report.owner.name, "Hendrik")
    IO.inspect(report2)
    IO.inspect(get_in(report2, [Access.key(:owner), Access.key(:name)]))

  end
end

Main.exec()


nested = %{
  buttercup: %{
    actor: %{
      first: "Robin",
      last: "Williams"
    }
  },
  westley: %{
     actor: %{
       first: "Danny",
       last: "DeVito"
     }
   }
}

IO.inspect(get_in nested, [:buttercup, :actor, :last])
