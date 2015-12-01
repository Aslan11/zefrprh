isInDOMTree = () ->
  if document.getElementById('pull_request_body') isnt null
    return true
  else
    return false

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
    if element.value is null or element.value is undefined or element.value is ''
      element.value = '### Summary\n\n### Bug Fixes/New Features\n\n### How to Verify\n\n### Side Effects\n\n### Resolves\n\n### Tests\n\n### Code Reviewer(s)'
)
