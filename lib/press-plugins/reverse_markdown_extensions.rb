# frozen_string_literal: true

require 'reverse_markdown'

# Sent as a patch to reverse_markdown
# https://github.com/xijo/reverse_markdown/issues/101
module ReverseMarkdown
  module Converters
    class Footnote < A
      def convert(node, state = {})
        # If the link has a circular reference, we need to check if it's
        # inside a paragraph or it's the first element of a paragraph or
        # list item.
        if node['id'] && node['href']&.start_with?('#')
          parent = node.parent

          # The link could be contained in a <sup>
          until %[p li].include?(parent.name) do
            parent = parent.parent

            # Don't go further than this
            break if parent.name == 'body'
          end

          first_child = parent.first_element_child

          # If it's the first link on the parent, it's the footnote
          # itself, otherwise it's the reference.
          if first_child == node || first_child.children.include?(node)
            "[^#{node['href'].tr('#', '')}]:"
          else
            "[^#{node['id']}]"
          end
        # Just process the link.
        else
          super
        end
      end
    end

    register :a, Footnote.new
  end
end
