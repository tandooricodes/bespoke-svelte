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
	class={cn('container mx-auto max-w-6xl p-8 pt-12', className)}
	{...restProps}
>
	{@render children?.()}
</div>
