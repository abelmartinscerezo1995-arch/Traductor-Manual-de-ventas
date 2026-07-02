import streamlit as st
import os

# 1. Make the page use the full screen width
st.set_page_config(
    layout="wide",
    initial_sidebar_state="collapsed"
)

# 2. Read your HTML file
try:
    with open('index.html', 'r', encoding='utf-8') as f:
        html_content = f.read()

    # 3. Display it, letting the iframe take up as much space as possible
    st.components.v1.html(
        html_content,
        height=1000,     # A large height to fill the screen
        scrolling=True,  # Allows scrolling if the content is taller
        width=None       # The default, which fills the full width in 'wide' mode
    )
except FileNotFoundError:
    st.error("❌ index.html file not found!")