<script>
	import { cn } from '../../../utils.js';

	/** @type {{
	 *   class?: string,
	 *   children?: import('svelte').Snippet,
	 *   [key: string]: any
	 * }} */
	let { class: className, children, ...restProps } = $props();
</script>

<div data-slot="page-container" class={cn('pt-12 p-8 container mx-auto max-w-6xl', className)} {...restProps}>
	{@render children?.()}
</div>
