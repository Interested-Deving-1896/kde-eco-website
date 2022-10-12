CMS.registerEditorComponent({
    id: "container",
    label: "Container",
    fields: [
        {
            name: "class",
            label: "Additional classes",
            widget: 'string',
            default: ' '
        },
        {
            name: "content",
            label: "Content",
            widget: "markdown"
        }
    ],
    pattern: /{{< container class="(.*?)" >}}\n(.*?)\n{{< \/container >}}/ms,
    fromBlock: function(match) {
        return {
            class: match[1],
            content: match[2]
        };
    },
    toBlock: function(obj) {
        return `{{< container class="${obj.class}" >}}\n${obj.content}\n{{< /container >}}`;
    },
    toPreview: function(obj) {
        return `<div class="container py-5 ${obj.class}">\n${obj.content}\n</div>`;
    },
});
