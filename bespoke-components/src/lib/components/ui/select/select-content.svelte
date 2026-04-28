<script>
	import { getContext } from 'svelte';
	import { cn } from '../../../utils.js';

	/** @type {{ children?: import('svelte').Snippet, class?: string, [key: string]: any }} */
	let { children, class: className, ...restProps } = $props();

	const ctx = /** @type {{ open: boolean }} */ (getContext('select'));
</script>

{#if ctx.open}
	<div
		role="listbox"
		onclick={(e) => e.stopPropagation()}
		class={cn(
			'absolute top-full z-50 mt-1 max-h-60 w-full overflow-x-hidden overflow-y-auto rounded-md border border-border bg-popover p-1 text-popover-foreground shadow-md',
			className
		)}
		{...restProps}
	>
		{@render children?.()}
	</div>
{/if}
