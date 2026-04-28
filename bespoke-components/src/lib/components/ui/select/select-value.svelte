<script>
	import { getContext } from 'svelte';
	import { cn } from '../../../utils.js';

	/** @type {{ placeholder?: string, class?: string, [key: string]: any }} */
	let { placeholder = '', class: className, ...restProps } = $props();

	const ctx = /** @type {{ selectedLabel: string }} */ (getContext('select'));
</script>

<span class={cn(ctx.selectedLabel ? '' : 'text-muted-foreground', className)} {...restProps}>
	{ctx.selectedLabel || placeholder}
</span>
