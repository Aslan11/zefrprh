isInDOMTree = () ->
  return document.getElementById('pull_request_body') != null

executeOnLoad = (func) ->
  # This function will check, every tenth of a second, to see if
  # our element pull_request_body is a part of the DOM tree - as soon as we know
  # that it is, we execute the provided function.
  if isInDOMTree()
    func()
  else
    setTimeout (->
      executeOnLoad func
      return
    ), 100
  return

executeOnLoad( ->
    element = document.getElementById('pull_request_body')
    if not element.value
      element.value = """
      ### Summary
      ### Bug Fixes/New Features
      ### How to Verify
      ### Side Effects
      ### Resolves
      ### Tests
      ### Code Reviewer(s)
      """
)
