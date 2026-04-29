<script>
	import { Tabs as TabsPrimitive } from 'bits-ui';
	import { cn } from '../../../utils.js';

	let { ref = $bindable(null), class: className = '', value, ...restProps } = $props();
</script>

<TabsPrimitive.Content
	bind:ref
	data-slot="tabs-content"
	{value}
	class={cn('flex-1 text-sm outline-none', className)}
	{...restProps}
/>
