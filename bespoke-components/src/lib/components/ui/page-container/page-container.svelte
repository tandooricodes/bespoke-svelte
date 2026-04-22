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
	class={cn('w-full grid px-7 pb-12 md:pl-28', className)}
	{...restProps}
>
	{@render children?.()}
</div>
