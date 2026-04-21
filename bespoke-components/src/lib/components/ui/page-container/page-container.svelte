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
	class={cn('container grid px-7 py-12 md:px-28', className)}
	{...restProps}
>
	{@render children?.()}
</div>
