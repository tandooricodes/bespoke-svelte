<script>
	import { setContext } from 'svelte';
	import { cn } from '../../../utils.js';

	/** @type {{
	 *   value: string,
	 *   disabled?: boolean,
	 *   children?: import('svelte').Snippet,
	 *   class?: string,
	 *   [key: string]: any
	 * }} */
	let { value, disabled = false, children, class: className, ...restProps } = $props();

	setContext('accordion-item', {
		get value() { return value; },
		get disabled() { return disabled; }
	});
</script>

<div class={cn('border-b border-border', className)} {...restProps}>
	{@render children?.()}
</div>
