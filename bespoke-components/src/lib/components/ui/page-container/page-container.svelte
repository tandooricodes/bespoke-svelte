<script>
	import { cn } from '../../../utils.js';

	/** @type {{
	 *   class?: string,
	 *   children?: import('svelte').Snippet,
	 *   [key: string]: any
	 * }} */
	let { class: className, children, ...restProps } = $props();
</script>

<div
	data-slot="page-container"
	class={cn('container px-7 py-12 md:px-28 grid', className)}
	{...restProps}
>
	{@render children?.()}
</div>
